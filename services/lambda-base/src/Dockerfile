FROM public.ecr.aws/lambda/python:3.9

# set LAMBDA_TASK_ROOT
ENV LAMBDA_TASK_ROOT /var/task
RUN mkdir -p ${LAMBDA_TASK_ROOT}
WORKDIR ${LAMBDA_TASK_ROOT}

# set PYTHONPATH
ENV PYTHONPATH ${LAMBDA_TASK_ROOT}/site-packages

# install library
COPY requirements.txt ${LAMBDA_TASK_ROOT}
RUN pip install --upgrade pip \
 && pip install -t ./site-packages -r requirements.txt

# copy sources
COPY . ${LAMBDA_TASK_ROOT}

CMD ["app.lambda_handler"]
