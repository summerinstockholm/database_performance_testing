# database_performance_testing
MySQL Database Performance Testing.
Нагрузочное тестирование базы данных MySQL через Jmeter.
1. Скачать и установить MySQL:
https://dev.mysql.com/downloads/installer/
2. В локальном MySQL конекшене SQL скриптом airport_database_example.sql создать БД (создасться новая схема). Сама модель базы данных лежит в файле airport_database_model.mwb.
3. Наполнить таблицы БД данными выполнив поочередны скрипты: 
    * insert_values_into_pass_in_trip.sql
    * insert_values_into_trip.sql
    * insert_values_into_passenger.sql
    * insert_values_into_company.sql
4. Скачать и распаковать Jmeter.
https://jmeter.apache.org/download_jmeter.cgi
5. Коннектор в виде джарника mysql-connector-java-8.0.26 лежит в папке C:\Program Files (x86)\MySQL\Connector J 8.0. (если путь установки MySQL был дефолтным). Его необходимо скопировать в папку с распакованным Jmeter, а точнее в папку apache-jmeter-5.3\lib\.
6. Открыть тест план TestPlanAirportDBExample.jmx в Jmeter. Внутри простейший групптред с конфигурацией соединения с локальной БД, JDBC реквестом (внутри него тестовый запрос по двум таблицам), респонс ассершеном на успешный код ответа, результаты в дереве и в таблице.
7. Настройки JDBC Connection Configuration:
    * Database URL: jdbc:mysql://localhost:3306/airport_database_example
    * JDBC Driver class: com.mysql.jdbc.Driver
    * Username: Имя вашего пользователя БД (в jmx файле указан root пользователь, если у вас не root надо заменить)
    * Password: Пароль вашего пользователя БД (не указан, надо вставить свой)
8. Количество потоков регулируется в ThreadGroup в поле Number of Threads (users). Число конекшенов на стороне БД регулируется в MySQL во вкладке Administration->Status and System Variables. В System Variables по поиску "connections" можно менять значение переменной.