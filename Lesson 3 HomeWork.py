##1

def div(*args):

    try:
        arg1 = int(input("Ведите  первое число >>> "))
        arg2 = int(input("Ведите  второе число >>> "))
        res = arg1 / arg2
    except ValueError:
        return 'Ошибка'
    except ZeroDivisionError:
        return "Вы ввели 0! Делить на 0 нельзя"

    return res

    '''
    if arg2 != 0:
        return arg1 / arg2
    else:
        print("Ошибка ! Делить на 0 нельзя")
    '''


print(f'result  {div()}')

##2
inputLn = ""
info = []

while len(info) != 6:
    inputLn = input("Введите через пробел имя, фамилию, год рождения, город, почту и телефон (6 значений)\n")
    info = inputLn.split()
    if len(info) != 6:
        print("Вы ввели не корректное число данных - повторите ввод")


def userInfo(name="<Не введено>",
             family="<Не введено>",
             year=" <Не введено>",
             city="<Не введено>",
             email="<Не введено>",
             phone="<Не введено>"
             ):
    print(f"""  
Инормация о пользователе 
имя: {name}
фамилия: {family}
год рождения: {year}
город: {city}
почта: {email}
телефон {phone}
""")


"""фамилия и телефон не внесены намеренно"""
userInfo(name=info[0], year=info[2], city=info[3], email=info[5])

##3

def my_func(arg1 , arg2, arg3):
    if arg1 >= arg3 and arg2 >= arg3:
        return arg1 + arg2
    elif arg1 > arg2 and arg1 < arg3:
        return arg1 + arg3
    else:
        return arg2 + arg3

print(f'Result - {my_func(int(input("enter first argument ")), int(input("enter second argument ")), int(input("enter third argument ")))}')

##4


def my_func(x,y):
    count = abs(y)-1
    result = x
    while count != 0:
        result = x * result
        count -= 1
    if y < 0:
        result = 1 / result
    if y % 2 != 0:
        result = result * -1
    print(result)

my_func(3,-2)