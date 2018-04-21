# Giganinja

## Dependências:

- docker
- docker-compose
- make

## Build

```
$ make run build
```

## Testar

```
$ make run-test
```

## Rodar no ambiente de DEV
```
$ make run-dev
```

---

### TODO:
- Melhorar mensagens de erro
- Mais testes
- CSS

---

### Utilidades para o Docker

#### Remover todos os containers
```
$ docker rm -f $(docker ps -aq)
```
* use ```-f``` depois do ```rm``` para forçar

#### Remover todos os volumes
```
$ docker volume prune
```
* use ```-f``` depois do ```prune``` para forçar


#### Remover todas as imagens
```
$ docker rmi -f $(docker images -aq)
```
* use ```-f``` depois do ```rmi``` para forçar
