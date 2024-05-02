FROM ubuntu:latest

# Cài đặt các dependencies
RUN apt-get update && \
    apt-get install -y curl

# Cài đặt AdGuardHome
RUN curl -sSL https://static.adguard.com/adguardhome/release/AdGuardHome_linux_amd64.tar.gz | tar -xz -C /opt && \
    mv /opt/AdGuardHome /opt/adguardhome

# Sao chép file cấu hình
COPY AdGuardHome.yaml /opt/adguardhome/AdGuardHome.yaml

# Mở các port cần thiết
EXPOSE 53 67/udp 68/udp 80 443

# Chạy AdGuardHome
CMD ["/opt/adguardhome/AdGuardHome", "-c", "/opt/adguardhome/AdGuardHome.yaml"]
