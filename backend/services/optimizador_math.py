from ortools.linear_solver import pywraplp

def solve_shopping_optimization(productos, datos_supermercados, precios, valor_tiempo, max_supermercados):
    """
    Modelo Matemático MILP (Mixed Integer Linear Programming) para optimizar la compra.
    """
    coste_por_km = 0.26 # Según Orden HFP/793/2023
    solver = pywraplp.Solver.CreateSolver('SCIP')
    
    if not solver:
        return {"estado": "Error: Solucionador no encontrado", "decisiones": {}}

    x = {} # Variable de decisión: comprar producto i en super j
    y = {} # Variable de decisión: visitar super j
    
    nombres_supers = list(datos_supermercados.keys())

    for j in nombres_supers:
        y[j] = solver.IntVar(0, 1, f'y_{j}')

    for i in productos:
        for j in nombres_supers:
            if j in precios[i]: # Solo creamos la variable si el super vende este producto
                x[i, j] = solver.IntVar(0, 1, f'x_{i}_{j}')

    # Restricción A: Satisfacción de la demanda (comprar cada ítem exactamente 1 vez)
    for i in productos:
        solver.Add(sum(x[i, j] for j in nombres_supers if j in precios[i]) == 1)

    # Restricción B: Activación de visita (si compro en J, tengo que visitar J)
    for i in productos:
        for j in nombres_supers:
            if j in precios[i]:
                solver.Add(x[i, j] <= y[j])

    solver.Add(sum(y[j] for j in nombres_supers) <= max_supermercados)

    # Función Objetivo (Minimizar Coste Total = Precio productos + Desplazamiento + Tiempo)
    objective_terms = []
    
    for i in productos:
        for j in nombres_supers:
            if j in precios[i]:
                objective_terms.append(precios[i][j] * x[i, j])
            
    for j in nombres_supers:
        coste_viaje = (datos_supermercados[j]['distancia_km'] * coste_por_km) 
        coste_tiempo = (valor_tiempo * datos_supermercados[j]['tiempo_h'])
        coste_fijo_visita = coste_viaje + coste_tiempo
        
        objective_terms.append(coste_fijo_visita * y[j])
        
    solver.Minimize(sum(objective_terms))

    status = solver.Solve()

    if status == pywraplp.Solver.OPTIMAL:
        decisiones_finales = {}
        
        for i in productos:
            for j in nombres_supers:
                if j in precios[i]:
                    # Usamos > 0.5 por si el modelo devuelve 0.99999 por precisión de coma flotante
                    if x[i, j].solution_value() > 0.5: 
                        decisiones_finales[i] = j 
        return {
            "estado": "Solución encontrada", 
            "decisiones": decisiones_finales
        }
    else:
        return {
            "estado": "Infactible", 
            "decisiones": {}
        }