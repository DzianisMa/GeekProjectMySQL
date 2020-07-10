# FirstName = input("Введите ваше имя >>>")
# LastName = input("Введите вашу фамилия >>>")
# City = input("Введите город вашего рождения >>>")
# Birthday = int(input("Введите дату вашего рождения >>>"))
# print(FirstName,LastName,'вы родились в городе',City, Birthday,' числа')


# seconds = int(input("Введите время в секундах >>>"))
# hours = seconds // 3600
# minutes = (seconds-hours*3600) // 60
# second = seconds % 60
# print(hours,'часов',minutes,'минут',second,'секунд')


# number = int(input("Введите значене числа N >>>"))
# result = number + (number*10+number) + (number*100+number*10+number)
# print ('Сумма числа',number,'+',number,number,'+',number,number,number,'равна',result)


# n = abs(int(input("Введите целое положительное число ")))
# max = n % 10
# while n >= 1:
#    n = n // 10
#    if n % 10 > max:
 #       max = n % 10
#    if n > 9:
#        continue
#    else:
#        print("Максимальное цифра в числе ", max)
#        break


#profit = float(input("Введите выручку фирмы "))
#costs = float(input("Введите издержки фирмы "))
#if profit > costs:
#    print(f"Фирма работает с прибылью. Рентабельность выручки составила {profit / costs:.2f}")
#    workers = int(input("Введите количество сотрудников фирмы "))
#    print(f"прибыль в расчете на одного сторудника сотавила {profit / workers:.2f}")
#elif profit == costs:
#    print("Фирма работает в ноль")
#else:
#    print("Фирма работает в убыток")


a = int(input("Введите результаты пробежки первого дня в км "))
b = int(input("Введите общий желаемый результат в км "))
result_days = 1
result_km = a
while result_km < b:
        a = a + 0.1 * a
        result_days += 1
        result_km = result_km + a
        print(f"Рельтат {result_days} дня составил {result_km}")
print(f"Вы достигнете требуемых показателей на {result_days} день")
