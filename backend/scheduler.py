from apscheduler.schedulers.blocking import BlockingScheduler
import subprocess

def ejecutar_scraper():
    print("Iniciando ejecución programada del scraper y procesamiento LLM...")
    subprocess.run(["python", "scraperCompleto.py"])

if __name__ == '__main__':
    scheduler = BlockingScheduler()
    scheduler.add_job(ejecutar_scraper, 'cron', hour=0, minute=0)
    print("Planificador APScheduler iniciado. Esperando tareas...")
    scheduler.start()