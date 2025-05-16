# goows-kafka-server

`goows` 어플리케이션을 위한 카프카 서버 빌드용 레포

## 카프카 클러스터 컴포넌트

- 총 3가지를 빌드합니다. 
  `redis`의 경우 백엔드 서버의 `redis`와 포트충돌을 막기위해 다른 포트를 사용합니다


`kafkaserver` : 9092 포트

`redis server` : 6380 포트

`zookeeper` : 2181 포트

- 네트워크 관련

일단 외부 다른 컨테이너와 통신을 위해 빌드해놨습니다.

```yaml
networks:
  default:
    name: goows-kafkas
```

- 서버빌드
```
docker compose up --build -d
```
<img src='https://github.com/user-attachments/assets/94ed384e-f778-45bc-a175-2a0b0c70fc3a'>

<img src='https://github.com/user-attachments/assets/a9b43237-e026-4188-88d7-c8b8cf0bba93'>
