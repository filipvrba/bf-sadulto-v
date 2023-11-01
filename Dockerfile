FROM thevlang/vlang:alpine-dev AS builder

RUN apk update && apk upgrade
RUN apk --no-cache add upx git

WORKDIR /opt
RUN git clone https://github.com/vlang/v.git

WORKDIR /opt/v
RUN make

WORKDIR /app
RUN mkdir dist
COPY . .
RUN /opt/v/v -prod -o dist/app .

FROM alpine AS runtime

RUN apk update && apk upgrade \
    && apk add --no-cache openssl vim

WORKDIR /app
COPY --from=builder /app/dist/ .

EXPOSE 8080
CMD ["./app"]
