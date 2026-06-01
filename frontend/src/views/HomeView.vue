<script setup>
import { ref, onMounted, watch } from 'vue'
import { 
  FolderIcon, 
  BookmarkIcon, 
  ArrowPathIcon, 
  ShoppingCartIcon, 
  ArrowLeftIcon,
  TrophyIcon,
  CheckCircleIcon,
  ExclamationCircleIcon
} from '@heroicons/vue/24/outline'

const API_URL = import.meta.env.VITE_API_URL;

const tituloLista = ref('Mi Lista de la Compra')
const nuevoItem = ref('')
const listaCompra = ref([])

const codigoPostal = ref(41001)
const maxSupermercados = ref(2)
const tiempo_libre = ref(true)

const cargando = ref(false)
const resultados = ref(null)

const modalAbierto = ref(false)
const productoAEditar = ref(null)
const alternativas = ref([])
const cargandoAlternativas = ref(false)

const plantillasGuardadas = ref([])
const mostrarMenuPlantillas = ref(false)

const toasts = ref([])
let toastIdCounter = 0

const mostrarToast = (mensaje, tipo = 'success') => {
  const id = toastIdCounter++
  toasts.value.push({ id, mensaje, tipo })
  
  setTimeout(() => {
    toasts.value = toasts.value.filter(t => t.id !== id)
  }, 3000)
}

onMounted(() => {
  const guardado = localStorage.getItem('smart_shopping_list')
  if (guardado) {
    const data = JSON.parse(guardado)
    listaCompra.value = data.lista || []
    tituloLista.value = data.titulo || 'Mi Lista de la Compra'
    codigoPostal.value = data.cp || 41001
  }

  const templates = localStorage.getItem('smart_templates')
  if (templates) {
    plantillasGuardadas.value = JSON.parse(templates)
  }
})

watch([listaCompra, tituloLista, codigoPostal], () => {
  const dataToSave = {
    lista: listaCompra.value,
    titulo: tituloLista.value,
    cp: codigoPostal.value
  }
  localStorage.setItem('smart_shopping_list', JSON.stringify(dataToSave))
}, { deep: true })

watch(plantillasGuardadas, (newVal) => {
  localStorage.setItem('smart_templates', JSON.stringify(newVal))
}, { deep: true })


const agregarItem = () => {
  if (!nuevoItem.value.trim()) return
  listaCompra.value.push({
    id_frontend: 'item_' + Date.now(),
    termino_busqueda: nuevoItem.value.trim(),
    cantidad: 1,
    restriccion_marca_original: false,
    restriccion_supermercado: 'Cualquiera',
    ids_fijados: []
  })
  nuevoItem.value = ''
}

const eliminarItem = (id) => {
  listaCompra.value = listaCompra.value.filter(item => item.id_frontend !== id)
}

const limpiarFijados = (item) => {
  item.ids_fijados = []
}

const guardarComoPlantilla = () => {
  if (listaCompra.value.length === 0) return
  const nombre = prompt('¿Cómo quieres llamar a esta lista? (Ej: Compra Mensual)')
  if (!nombre) return
  
  const copiaItems = JSON.parse(JSON.stringify(listaCompra.value))
  
  plantillasGuardadas.value.push({
    id: Date.now(),
    nombre: nombre,
    items: copiaItems
  })
  
  mostrarToast('Plantilla guardada con éxito', 'success')
}

const cargarPlantilla = (plantilla) => {
  if (listaCompra.value.length > 0) {
    const confirmar = confirm('Esto sobrescribirá tu lista actual. ¿Estás seguro?')
    if (!confirmar) return
  }
  
  listaCompra.value = JSON.parse(JSON.stringify(plantilla.items)).map(item => ({
    ...item,
    id_frontend: 'item_' + Date.now() + Math.random()
  }))
  tituloLista.value = plantilla.nombre
  mostrarMenuPlantillas.value = false
  
  mostrarToast(`Plantilla "${plantilla.nombre}" cargada`, 'success')
}

const borrarPlantilla = (id) => {
  plantillasGuardadas.value = plantillasGuardadas.value.filter(p => p.id !== id)
  mostrarToast('Plantilla eliminada', 'success')
}

const enviarListaAPI = async () => {
  if (listaCompra.value.length === 0) return
  cargando.value = true
  
  const payload = {
    preferencias: {
      tiempo_libre: tiempo_libre.value, 
      max_supermercados_visitar: maxSupermercados.value,
      codigo_postal: codigoPostal.value
    },
    lista_compra: listaCompra.value.map(item => ({
      id_frontend: item.id_frontend,
      termino_busqueda: item.termino_busqueda,
      cantidad: item.cantidad,
      restriccion_marca_original: item.restriccion_marca_original,
      restriccion_supermercado: item.restriccion_supermercado === 'Cualquiera' ? null : item.restriccion_supermercado,
      ids_fijados: item.ids_fijados
    }))
  }

  try {
    const respuesta = await fetch(`${API_URL}/optimizarLista`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', 'accept': 'application/json' },
      body: JSON.stringify(payload)
    })
    if (!respuesta.ok) throw new Error('Error en optimización')
    resultados.value = await respuesta.json()
    mostrarToast('¡Ruta calculada con éxito!', 'success')
  } catch (error) {
    mostrarToast('Error al conectar con el servidor', 'error')
  } finally {
    cargando.value = false
  }
}

const abrirModalModificar = async (itemCesta) => {
  const itemOriginal = listaCompra.value.find(i => i.id_frontend === itemCesta.id_frontend)
  if (!itemOriginal) return

  productoAEditar.value = itemOriginal
  modalAbierto.value = true
  cargandoAlternativas.value = true
  alternativas.value = []

  try {
    const url = `${API_URL}/productos/compararPrecio?nombre_producto=${encodeURIComponent(itemCesta.detalle_producto.nombre)}&max_resultados=20`
    const res = await fetch(url)
    if (!res.ok) throw new Error('Error buscando alternativas')
    alternativas.value = await res.json()
  } catch (error) {
    console.error(error)
    mostrarToast('No se pudieron cargar alternativas', 'error')
  } finally {
    cargandoAlternativas.value = false
  }
}

const seleccionarAlternativa = (id_producto_real) => {
  const index = productoAEditar.value.ids_fijados.indexOf(id_producto_real)
  if (index > -1) {
    productoAEditar.value.ids_fijados.splice(index, 1)
  } else {
    productoAEditar.value.ids_fijados.push(id_producto_real)
  }
}

const volverAElegir = () => { resultados.value = null }
</script>

<template>
  <div class="max-w-6xl mx-auto mt-8 p-4 relative">
    
    <div class="fixed top-4 right-4 z-50 flex flex-col gap-2">
      <TransitionGroup name="toast">
        <div v-for="toast in toasts" :key="toast.id" 
             class="px-4 py-3 rounded-lg shadow-lg text-sm font-bold flex items-center gap-2 transform transition-all"
             :class="toast.tipo === 'success' ? 'bg-green-600 text-white' : 'bg-red-600 text-white'">
          <CheckCircleIcon v-if="toast.tipo === 'success'" class="w-5 h-5" />
          <ExclamationCircleIcon v-else class="w-5 h-5" />
          {{ toast.mensaje }}
        </div>
      </TransitionGroup>
    </div>

    <div v-if="!resultados" class="grid grid-cols-1 lg:grid-cols-3 gap-6">
      
      <div class="lg:col-span-2 bg-white rounded-xl shadow-lg p-6 sm:p-8 relative">
        
        <div class="flex flex-col sm:flex-row justify-between items-start sm:items-center mb-6 gap-4">
          <input v-model="tituloLista" type="text" class="text-3xl font-bold text-gray-800 border-b-2 border-transparent hover:border-gray-200 focus:border-blue-500 outline-none flex-1 transition-colors bg-transparent"/>
          
          <div class="flex gap-2 relative">
            <button @click="mostrarMenuPlantillas = !mostrarMenuPlantillas" class="flex items-center gap-2 px-4 py-2 text-sm font-bold text-blue-600 bg-blue-50 hover:bg-blue-100 rounded-lg transition-colors border border-blue-200">
              <FolderIcon class="w-5 h-5" /> Mis Plantillas ({{ plantillasGuardadas.length }})
            </button>
            <button @click="guardarComoPlantilla" :disabled="listaCompra.length === 0" class="flex items-center gap-2 px-4 py-2 text-sm font-bold text-gray-600 bg-gray-100 hover:bg-gray-200 rounded-lg transition-colors border border-gray-300 disabled:opacity-50">
              <BookmarkIcon class="w-5 h-5" /> Guardar
            </button>

            <div v-if="mostrarMenuPlantillas" class="absolute top-12 right-0 w-64 bg-white border border-gray-200 shadow-xl rounded-xl z-10 overflow-hidden">
              <div class="p-3 border-b bg-gray-50 font-bold text-gray-700">Listas Guardadas</div>
              <div v-if="plantillasGuardadas.length === 0" class="p-4 text-sm text-gray-500 italic text-center">No hay plantillas.</div>
              <ul class="max-h-60 overflow-y-auto">
                <li v-for="plan in plantillasGuardadas" :key="plan.id" class="border-b last:border-0 hover:bg-blue-50 transition-colors flex justify-between items-center group">
                  <button @click="cargarPlantilla(plan)" class="flex-1 text-left p-3 text-sm font-medium text-gray-800">
                    {{ plan.nombre }} <span class="text-xs text-gray-400 ml-1">({{ plan.items.length }})</span>
                  </button>
                  <button @click="borrarPlantilla(plan.id)" class="px-3 text-red-400 hover:text-red-600 font-bold opacity-0 group-hover:opacity-100 transition-opacity" title="Borrar">✕</button>
                </li>
              </ul>
            </div>
          </div>
        </div>

        <form @submit.prevent="agregarItem" class="flex gap-2 mb-6">
          <input v-model="nuevoItem" type="text" placeholder="Añade un producto..." class="flex-1 px-4 py-3 rounded-lg border border-gray-300 focus:ring-2 focus:ring-blue-500 outline-none transition-all"/>
          <button type="submit" class="px-6 py-3 bg-gray-800 text-white font-semibold rounded-lg hover:bg-gray-700 transition-colors">Añadir</button>
        </form>

        <div v-if="listaCompra.length === 0" class="text-gray-400 text-center italic mt-10 min-h-[200px]">Tu lista está vacía.</div>
        
        <TransitionGroup v-else name="list" tag="ul" class="space-y-4 mb-8 min-h-[200px] relative">
          <li v-for="(item, index) in listaCompra" :key="item.id_frontend" class="p-4 bg-gray-50 rounded-lg border border-gray-200 shadow-sm flex flex-col gap-3">
            <div class="flex justify-between items-center">
              <div class="flex items-center gap-3 flex-1">
                <span class="text-gray-400 font-bold">{{ index + 1 }}.</span>
                <input v-model="item.termino_busqueda" type="text" class="text-lg text-gray-800 font-bold bg-transparent border-b border-transparent hover:border-gray-300 focus:border-blue-500 focus:bg-white outline-none px-1 transition-all flex-1"/>
              </div>
              <div class="flex items-center gap-3 ml-4">
                <input type="number" v-model="item.cantidad" min="1" class="w-16 p-1 text-center border rounded">
                <button @click="eliminarItem(item.id_frontend)" class="text-red-500 text-xl hover:scale-110 transition-transform" title="Eliminar producto">✕</button>
              </div>
            </div>
            <div class="flex flex-wrap items-center gap-4 bg-white p-2 rounded border border-gray-100 text-sm">
              <label class="flex items-center gap-2 cursor-pointer text-gray-700 font-medium">
                <input type="checkbox" v-model="item.restriccion_marca_original" class="w-4 h-4 text-blue-600 rounded"> Solo Marca Original
              </label>
              <div class="flex items-center gap-2">
                <label class="text-gray-600 font-medium">Fijar Súper:</label>
                <select v-model="item.restriccion_supermercado" class="border border-gray-300 rounded p-1 bg-white outline-none focus:ring-2 focus:ring-blue-500">
                  <option value="Cualquiera">Cualquiera</option>
                  <option value="dia">Dia</option>
                  <option value="mercadona">Mercadona</option>
                  <option value="carrefour">Carrefour</option>
                </select>
              </div>
              <div v-if="item.ids_fijados.length > 0" class="flex items-center gap-1 bg-green-50 border border-green-200 rounded-full pl-2 pr-1 py-0.5 transition-all">
                <span class="text-xs text-green-700 font-bold">✓ {{ item.ids_fijados.length }} fijados</span>
                <button @click="limpiarFijados(item)" class="text-green-600 hover:text-red-600 font-bold text-sm px-1 rounded-full hover:bg-red-50 transition-colors" title="Quitar productos fijados">✕</button>
              </div>
            </div>
          </li>
        </TransitionGroup>
      </div>

      <div class="flex flex-col gap-6">
        <div class="bg-white rounded-xl shadow-lg p-6 border-t-4 border-blue-500">
          <h2 class="text-xl font-bold mb-4">Preferencias de Ruta</h2>
          <div class="space-y-4">
            <div>
              <label class="block text-sm font-medium text-gray-700">Código Postal</label>
              <input type="number" v-model="codigoPostal" class="w-full p-2 border rounded-lg outline-none focus:ring-2 focus:ring-blue-500">
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-700">Límite de supermercados</label>
              <input type="number" v-model="maxSupermercados" min="1" max="5" class="w-full p-2 border rounded-lg outline-none focus:ring-2 focus:ring-blue-500">
            </div>
            <div class="pt-2 border-t">
              <label class="flex items-center cursor-pointer justify-between">
                <span class="text-sm font-medium text-gray-700">Tengo tiempo libre</span>
                <div class="relative">
                  <input type="checkbox" v-model="tiempo_libre" class="sr-only peer">
                  <div class="w-11 h-6 bg-gray-200 rounded-full peer peer-checked:bg-blue-500 transition-colors"></div>
                  <div class="absolute top-[2px] left-[2px] bg-white border border-gray-300 rounded-full h-5 w-5 transition-transform peer-checked:translate-x-full peer-checked:border-white"></div>
                </div>
              </label>
              <p class="text-xs text-gray-500 mt-1">
                <span v-if="tiempo_libre">¡Buscaremos el máximo ahorro!</span>
                <span v-else>Priorizaremos la cercanía y rapidez sobre el ahorro extremo.</span>
              </p>
            </div>
          </div>
        </div>
        
        <button @click="enviarListaAPI" :disabled="listaCompra.length === 0 || cargando" class="w-full py-4 bg-green-600 text-white text-xl font-bold rounded-xl shadow-lg disabled:bg-gray-300 flex justify-center items-center gap-2 transition-transform active:scale-95">
          <span v-if="cargando" class="animate-pulse flex items-center gap-2">
            <ArrowPathIcon class="w-6 h-6 animate-spin" /> Optimizando...
          </span>
          <span v-else class="flex items-center gap-2">
            <ShoppingCartIcon class="w-6 h-6" /> ¡Manos al carrito!
          </span>
        </button>
      </div>
    </div>

    <div v-else class="space-y-6">
      
      <div class="flex justify-between items-center mb-4">
        <button @click="volverAElegir" class="flex items-center gap-2 bg-white hover:bg-gray-50 text-gray-700 px-4 py-2 rounded-lg font-bold text-sm transition-colors border border-gray-300 shadow-sm">
          <ArrowLeftIcon class="w-4 h-4" /> Volver a modificar lista
        </button>
        <button @click="enviarListaAPI" class="bg-orange-500 hover:bg-orange-600 text-white px-6 py-2 rounded-lg font-bold shadow-lg flex items-center gap-2 transition-transform active:scale-95">
          <ArrowPathIcon class="w-5 h-5" /> Relanzar con mis cambios
        </button>
      </div>

      <div class="bg-gradient-to-r from-emerald-500 to-teal-600 rounded-xl p-6 sm:p-8 shadow-lg text-white flex flex-col sm:flex-row items-center justify-between gap-6">
        <div>
          <h2 class="text-3xl font-black mb-2 tracking-tight flex items-center gap-3">
            <TrophyIcon class="w-8 h-8 text-yellow-300" /> ¡Ruta Optimizada!
          </h2>
          <p class="text-emerald-50 font-medium">Nuestro optimizador ha cruzado miles de precios para darte la mejor opción. ¡No busques más!</p>
        </div>
        <div class="bg-white/20 p-4 rounded-xl text-center min-w-[150px] border border-white/30 backdrop-blur-sm">
          <div class="text-xs uppercase tracking-wider font-bold text-emerald-100 mb-1">Ahorro Máximo</div>
          <div class="text-4xl font-black text-white">{{ resultados.resumen_logistico.ahorro_maximo_conseguido_euros }}€</div>
        </div>
      </div>

      <div class="bg-blue-50 border border-blue-200 rounded-xl p-6 shadow-sm">
        <div class="grid grid-cols-2 sm:grid-cols-4 gap-4 text-center">
          <div class="bg-white p-3 rounded-lg shadow-sm border border-blue-100">
            <p class="text-sm text-gray-500 uppercase font-semibold">Coste Total</p>
            <p class="text-2xl font-bold text-green-600">{{ resultados.resumen_logistico.coste_total_compra_euros }}€</p>
          </div>
          <div class="bg-white p-3 rounded-lg shadow-sm border border-blue-100">
            <p class="text-sm text-gray-500 uppercase font-semibold">Tiempo</p>
            <p class="text-2xl font-bold text-blue-600">{{ resultados.resumen_logistico.tiempo_total_minutos }} min</p>
          </div>
          <div class="bg-white p-3 rounded-lg shadow-sm border border-blue-100">
            <p class="text-sm text-gray-500 uppercase font-semibold">Distancia</p>
            <p class="text-2xl font-bold text-blue-600">{{ resultados.resumen_logistico.distancia_total_km }} km</p>
          </div>
          <div class="bg-white p-3 rounded-lg shadow-sm border border-blue-100">
            <p class="text-sm text-gray-500 uppercase font-semibold">Supermercados</p>
            <div class="flex justify-center gap-1 mt-1 flex-wrap">
              <span v-for="supermercado in resultados.resumen_logistico.supermercados_a_visitar" :key="supermercado" class="px-2 py-1 bg-gray-200 text-[10px] font-bold rounded-full uppercase">
                {{ supermercado }}
              </span>
            </div>
          </div>
        </div>
      </div>

      <div class="bg-white rounded-xl shadow-lg p-6">
        <h3 class="text-2xl font-bold text-gray-800 mb-6 border-b pb-4">Cesta de la Compra</h3>
        <div class="space-y-4">
          <div v-for="item in resultados.cesta_optimizada" :key="item.id_frontend" class="flex flex-col sm:flex-row gap-4 p-4 border rounded-lg hover:shadow-md transition-shadow bg-white items-center relative">
            <img :src="item.detalle_producto.imagen" class="w-24 h-24 object-contain rounded">
            <div class="flex-1 text-center sm:text-left">
              <span class="inline-block px-2 py-1 bg-blue-100 text-blue-800 text-xs font-bold rounded uppercase mb-2">
                {{ item.supermercado_asignado }}
              </span>
              <h4 class="font-bold text-gray-800 line-clamp-2 leading-tight">{{ item.detalle_producto.nombre }}</h4>
              <p class="text-sm text-gray-500 mt-1">{{ item.detalle_producto.precio_unidad }}€ / {{ item.detalle_producto.unidad_medida }}</p>
            </div>
            <div class="flex flex-col items-center sm:items-end gap-2">
              <span class="text-2xl font-bold text-green-600">{{ item.precio_total_asignado }}€</span>
              <button @click="abrirModalModificar(item)" class="px-4 py-2 text-sm text-orange-600 font-bold border border-orange-200 bg-orange-50 hover:bg-orange-100 rounded-lg transition-colors">
                Modificar Alternativa
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div v-if="modalAbierto" class="fixed inset-0 bg-black/60 flex items-center justify-center z-50 p-4 backdrop-blur-sm">
      <div class="bg-white rounded-2xl shadow-2xl max-w-2xl w-full max-h-[85vh] overflow-hidden flex flex-col">
        <div class="p-6 border-b flex justify-between items-center bg-gray-50">
          <div>
            <h3 class="text-xl font-bold text-gray-800">Selección Manual</h3>
            <p class="text-xs text-gray-500">Elige los productos aceptables para "{{ productoAEditar?.termino_busqueda }}"</p>
          </div>
          <button @click="modalAbierto = false" class="text-2xl hover:text-red-500">✕</button>
        </div>

        <div class="p-6 overflow-y-auto bg-white flex-1">
          <div v-if="cargandoAlternativas" class="text-center py-12">
            <ArrowPathIcon class="w-12 h-12 text-blue-600 animate-spin mx-auto" />
          </div>
          <div v-else class="grid grid-cols-1 gap-3">
            <div v-for="alt in alternativas" :key="alt.id_producto_bd" 
                 @click="seleccionarAlternativa(alt.id_producto_bd)"
                 :class="['flex items-center gap-4 p-4 border rounded-xl cursor-pointer transition-all', 
                          productoAEditar?.ids_fijados.includes(alt.id_producto_bd) ? 'border-blue-500 bg-blue-50 ring-1 ring-blue-500' : 'border-gray-200 hover:border-blue-300']">
              
              <div class="w-6 h-6 rounded border-2 flex items-center justify-center transition-colors shrink-0" 
                   :class="productoAEditar?.ids_fijados.includes(alt.id_producto_bd) ? 'bg-blue-600 border-blue-600' : 'border-gray-300 bg-white'">
                <span v-if="productoAEditar?.ids_fijados.includes(alt.id_producto_bd)" class="text-white text-xs font-bold">✓</span>
              </div>
              
              <img :src="alt.imagen" class="w-16 h-16 object-contain bg-white rounded shrink-0">
              
              <div class="flex-1 min-w-0">
                <h4 class="font-bold text-gray-800 text-sm leading-tight truncate">{{ alt.nombre }}</h4>
                <div class="flex justify-between items-center mt-2">
                  <span class="text-blue-600 font-bold">{{ alt.precio }}€</span>
                  <span class="text-[10px] bg-white px-2 py-1 border rounded font-bold uppercase text-gray-500">
                    {{ alt.supermercado.nombre }}
                  </span>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="p-4 bg-gray-50 border-t flex justify-between items-center">
          <span class="text-sm font-bold text-gray-600">{{ productoAEditar?.ids_fijados.length }} seleccionados</span>
          <button @click="modalAbierto = false" class="bg-blue-600 text-white px-8 py-2 rounded-lg font-bold hover:bg-blue-700">Guardar Cambios</button>
        </div>
      </div>
    </div>

  </div>
</template>

<style scoped>
.list-move,
.list-enter-active,
.list-leave-active {
  transition: all 0.4s ease-in-out;
}

.list-leave-active {
  overflow: hidden;
  max-height: 250px; 
}

/* Estado desde el que entra un nuevo producto */
.list-enter-from {
  opacity: 0;
  transform: translateX(-30px);
}

/* Estado al que va el producto borrado: Todo a CERO */
.list-leave-to {
  opacity: 0;
  transform: translateX(30px); 
  
  max-height: 0 !important;
  padding-top: 0 !important;
  padding-bottom: 0 !important;
  margin-top: 0 !important;
  margin-bottom: 0 !important;
  border-width: 0 !important;
}

/* Transiciones del Toast */
.toast-enter-active,
.toast-leave-active {
  transition: all 0.3s ease;
}
.toast-enter-from {
  opacity: 0;
  transform: translateY(-20px) scale(0.9);
}
.toast-leave-to {
  opacity: 0;
  transform: translateY(-20px);
}
</style>