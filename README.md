# salt-formula-users

## Develop salt formula for user control on controlled host machines

Updated 18:27 21.05.2018 - (исправили имена пользователей, пункт 5.а)
Updated 21:04 24.05.2018 - (добавлен пункт 6, для разъяснения)

Общие требования к выполнению практического задания:

    1. Выполненное задание должно располагаться в отдельном репозитории на github.com, т.е. если учетная запись на github называется ‘user’ и выполняется практическое задание с названием ‘salt-formula-users’, то файлы задания должны быть доступны в репозитарии https://github.com/user/salt-formula-users. 
    2. Для проверки выполнения ДЗ будет использована свежеустановленная VM из этих образов - https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img и https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud-1503.qcow2. На виртуальных машинах будет установлен salt minion и подключен к salt мастеру, salt minion id для проверки будет minion-ubuntu и minion-centos
    3. Для выполнения задания разрешается устанавливать любые дополнительные пакеты. В случае использования пакетов, которые не установлены в образе, необходимо предусмотреть через салт стак.
    4. В корне репозитория так же должен лежать файл README.md в четкими интсрукциями и примерами использования формулы
    5. В корне репозитория так же должна быть папка tests, внутри которой будет лежать pillar/top.sls (с правильным маппингом пилларов к миньонам по семейству операционной системы, для centos и для ubuntu  должны быть заданы по одному разному пользователю с разными публичными ключами (canonical и redhat соответственно), и при этом удалять противоположного пользователя ). Файлы на которые ссылаются в pillar/top.sls должны называться tests/pillar/users/ubuntu.sls и tests/pillar/users/centos.sls.
        a. На centos должен создаваться пользователь redhat и удалятся пользователь canonical, а на canonical наоборот. 
        b. Приватные ключи должны лежать в каталоге tests/ubuntu.pem и tests/centos.pem
    6. Так же в корне папки должен быть файл top.sls который будет указывать какие стейты применять на миньонах
    7. Deadline, конечный срок выполнения задани  23:59 27/05/2018
    
Задание

Develop salt formula for user control on controlled host machines:

    1. Салт формула должна предусматривать возможность создания пользователей а также их удаление.
    2. При создании пользователей должна быть возможность по желанию указывать:
        a. Имя пользователя
        b. Домашнюю директорию
        c. Один или несколько SSH публичных ключей
        d. Один или несколько SSH приватных ключей
        e. Группы в которых состоит пользователей
        f. Предусмотреть возможность предоставления пользователю использования команды sudo без пароля
        g. Устанавливать пользователю uid и gid

Проверка

    • Автоматическая проверка будет осуществляться по вашим же файлам которые лежат в папке tests
    • Ручная проверка будет осуществляться после автоматический

