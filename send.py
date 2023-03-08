import telegram

TOKEN = '5981434873:AAE1e260sk_8Xu5Gy9N93zodag9WBHuaxOM'
bot = telegram.Bot(TOKEN)
chat_id = '5088751124'
message = 'Hola, este es un mensaje de mi bot de Tele'
bot.send_message(chat_id=chat_id, text=message)
                                                   
