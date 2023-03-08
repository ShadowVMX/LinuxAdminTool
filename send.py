import telegram
import subprocess
from scapy.all import *

# Configura tu bot de Telegram
bot = telegram.Bot(token='5981434873:AAE1e260sk_8Xu5Gy9N93zodag9WBHuaxOM')

# ID de chat donde quieres enviar los logs
chat_id = '5088751124'

# Función para capturar paquetes DHCP y obtener información relevante
def dhcp_handler(packet):
    if DHCP in packet and packet[DHCP].options[0][1] == 5:
        # Obtener la información de la concesión DHCP
        hostname = packet[DHCP].options[3][1].decode('utf-8')
        ip = packet[BOOTP].yiaddr
        mac = packet[Ether].src
        timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        # Formatear la información y enviarla a través del bot de Telegram
        message = f'Dispositivo: {hostname}\nIP: {ip}\nMAC: {mac}\nHora de conexión: {timestamp}'
        bot.send_message(chat_id=chat_id, text=message)

# Capturar paquetes DHCP en tiempo real
sniff(filter='udp and (port 67 or 68)', prn=dhcp_handler)

# Ejecuta el comando 'tail' en la consola para obtener las últimas 10 líneas del archivo de registro del DHCP
process = subprocess.Popen(['tail', '-n', '10', '/var/log/syslog'], stdout=subprocess.PIPE)
output, error = process.communicate()

# Codifica la salida como una cadena de texto
logs = output.decode('utf-8')

# Envía los logs al bot de Telegram
bot.send_message(chat_id=chat_id, text=logs)
