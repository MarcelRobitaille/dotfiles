Problem:
status 500
occ upgrade gives database error

Solution:
```sql
set global innodb_default_row_format=dynamic;
set global default_storage_engine=InnoDB;
set global innodb_file_format = BARRACUDA;
```

```
sudo -u http php /usr/share/webapps/nextcloud/occ -vvv upgrade
```
