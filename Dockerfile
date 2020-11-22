# Base Image
FROM lambci/lambda:python3.7

# Set default environment variables
ENV AWS_DEFAULT_REGION eu-central-1

COPY . .

RUN npm install

RUN zip -9yr lambda.zip .

CMD aws lambda update-function-code --function-name mylambda --zip-file fileb://lambda.zip