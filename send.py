import telegram
import subprocess
                                         
# Configura tu bot de Telegram
bot = telegram.Bot(token='5981434873:AAE1e260sk_8Xu5Gy9N93zodag9WBHuaxOM')

# ID de chat donde quieres enviar los logs
chat_id = '5088751124'

# Ejecuta el comando 'tail' en la consola para obtener las últimas 10 líneas del archivo de registro del DHCP
process = subprocess.Popen(['tail', '-n', '10', '/var/log/syslog'], stdout=subprocess.PIPE)
output, error = process.communicate()

# Codifica la salida como una cadena de texto
logs = output.decode('utf-8')

# Envía los logs al bot de Telegram
bot.send_message(chat_id=chat_id, text=logs)
