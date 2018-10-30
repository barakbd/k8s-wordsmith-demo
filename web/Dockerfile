# BUILD
FROM golang:1.9.1-alpine3.6 as builder
COPY dispatcher.go .
RUN go build dispatcher.go

#TEST
FROM builder as test
COPY unit_test.sh .
RUN chmod +x ./unit_test.sh
# test with ENV_VAR or ARG

ARG UNIT_TEST_EXIT_CODE
RUN echo  ======= UNIT_TEST_EXIT_CODE --- $UNIT_TEST_EXIT_CODE =====
RUN ls -l
RUN ./unit_test.sh $UNIT_TEST_EXIT_CODE
# CMD ./unit_test.sh $UNIT_TEST_EXIT_CODE

# test with CMD
# ENTRYPOINT ["/bin/bash", "unit_test.sh"]
# CMD ["0"]

# RUN
FROM alpine:edge as run
COPY --from=builder /go/dispatcher /
COPY static /static/
EXPOSE 80
CMD ["/dispatcher"]
