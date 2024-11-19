*** Settings ***
Library    ${CURDIR}/../../src/AWSLibrary

*** Test Cases ***
Assume Role
    ${identity_before}  STS Get Caller Identity
    Log    Identity before assuming role: ${identity_before}
    STS Assume Role  arn:aws:iam::000000000000:role/localstack-role
    ${identity_after}    STS Get Caller Identity
    Log    Identity after assuming role: ${identity_after}
    S3 create bucket  test-robotframework-s3-bucket-assumed-role
