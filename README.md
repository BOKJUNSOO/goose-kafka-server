# goows-kafka-server

`goows` 어플리케이션을 위한 `spring, flink` 개발환경용 `kafka` 레포

## 카프카 클러스터 컴포넌트

`kafkaserver` : 9092 포트

`zookeeper` : 2181 포트

## 🔥 네트워크 관련 이슈

개발환경에서

- 로컬에서 직접 빌드하는 `spring` 서버 개발의 편의성과
- `docker`에 올려서 빌드한 `flink` 서버 개발의 편의성을 위해 네트워크를 설정합니다.
- 커스텀 프로토콜을 사용해 독립적으로 개발할 수 있도록 변수 설정을 해두었습니다.
```env
KAFKA_LISTENER_SECURITY_PROTOCOL_MAP=INTERNAL:PLAINTEXT,EXTERNAL:PLAINTEXT KAFKA_LISTENERS=INTERNAL://0.0.0.0:9093,EXTERNAL://0.0.0.0:9092 KAFKA_ADVERTISED_LISTENERS=INTERNAL://kafka:9093,EXTERNAL://localhost:9092
```

```yaml
networks:
  default:
    name: goows
```

- `spring` 을 개발을 한다면 아래의 명령어 실행합니다.
- `flink` 를 개발한다면 [flink](https://github.com/BOKJUNSOO/goows-flink-server) 레포를 확인!
- 스프링 서버는 `kafka url`을 `localhost:9092`로 설정

```bash
docker network create goows
docker compose up --build -d
# then build spring server or flink server
```

## 📩 토픽에 메세지 전송하기

- `spring & kafka` or `flink & kafka` 서버 빌드가 끝나고 카프카 컨테이너 진입
```bash
docker exec -it kafka /bin/bash
```
- 컨테이너 내부에 쉘파일을 빌드해놨습니다
```bash
cd /opt/kafka/jobs
./test-producer.sh
> 필요한 메세지를 발행합니다.
```
- 메세지 확인
```bash
./test-consumer.sh
> 토픽에 발행된 메세지를 확인합니다.
```

- 참고로 개발환경에서 kafka 컨테이너 내부는 9093 포트로 통신합니다.