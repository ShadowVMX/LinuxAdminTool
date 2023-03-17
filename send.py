import subprocess
import re
import requests

# Token del bot de Telegram
TOKEN = '5981434873:AAE1e260sk_8Xu5Gy9N93zodag9WBHuaxOM'

# ID del chat donde se enviará el mensaje
CHAT_ID = '5088751124'

# Expresión regular para buscar la información del cliente en el registro DHCP
regex = r'DHCPACK on (\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}) to ([^\s]+) \(([\dA-Fa-f]{2}[:-]){5}([\dA-Fa-f]{2})\).*lease (\d+)'

# Ejecutar el comando para leer el registro DHCP
output = subprocess.check_output(['cat', '/var/log/syslog | grep "DHCPACK on"'], shell=True)

# Buscar la información del cliente en el registro DHCP
match = re.search(regex, output.decode())

# Si se encuentra la información del cliente
if match:
    ip_address = match.group(1)
    hostname = match.group(2)
    mac_address = match.group(3).replace(':', '-')
    lease_time = match.group(4)

    # Construir el mensaje a enviar al bot de Telegram
    message = f'Cliente conectado al DHCP:\nIP: {ip_address}\nNombre de equipo: {hostname}\nDirección MAC: {mac_address}\nTiempo de concesión: {lease_time}'

    # Enviar el mensaje al bot de Telegram
    requests.get(f'https://api.telegram.org/bot{TOKEN}/sendMessage?chat_id={CHAT_ID}&text={message}')
