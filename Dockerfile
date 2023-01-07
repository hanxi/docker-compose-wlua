FROM hanxi/wlua:main
RUN cd / && wlua new code
WORKDIR /code
EXPOSE 8081
CMD [ "bash", "-c", "wlua start && tail -F log/wlua.log" ]
