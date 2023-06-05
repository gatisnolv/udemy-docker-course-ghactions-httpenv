FROM golang:alpine
COPY httpenv.go /go
RUN go build httpenv.go

FROM alpine
RUN addgroup -g 1000 httpenv \
    && adduser -u 1000 -G httpenv -D httpenv
COPY --from=0 --chown=httpenv:httpenv /go/httpenv /httpenv
# In a real use case, it would be better to add this in a separate stage in a multi-stage build instead of just adding a tool to the production image if it's actually not needed there, and is only for (in this case integration) tests, e.g. https://github.com/BretFisher/docker-ci-automation/blob/cfd519572be1a64c7f0c1202577198802c8351b8/Dockerfile
RUN apk add --no-cache curl
EXPOSE 8888
# we're not changing user in this example, but you could:
# USER httpenv
CMD ["/httpenv"]