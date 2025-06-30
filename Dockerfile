# Java 17 기반 이미지 사용
FROM eclipse-temurin:17-jdk

# 작업 디렉토리 생성
WORKDIR /app

# Gradle 캐시 최적화
COPY gradlew build.gradle settings.gradle ./
COPY gradle ./gradle
RUN chmod +x gradlew && ./gradlew build --no-daemon || true

# 소스 복사 후 빌드
COPY . ./
RUN ./gradlew build --no-daemon

# 실제 실행
CMD ["java", "-jar", "build/libs/helloCloud-0.0.1-SNAPSHOT.jar"]