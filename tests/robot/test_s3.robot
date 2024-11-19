*** Settings ***
Library    ${CURDIR}/../../src/AWSLibrary

*** Test Cases ***
Create a S3 bucket
    ${bucket_name}    S3 create bucket    test-robotframework-s3-bucket
    Should Be Equal As Strings    test-robotframework-s3-bucket    ${bucket_name}

Delete a S3 bucket
    S3 delete bucket    test-robotframework-s3-bucket

Verify a S3 bucket exists
    S3 create bucket    test-robotframework-s3-bucket
    S3 Should Exists    test-robotframework-s3-bucket
    S3 delete bucket    test-robotframework-s3-bucket

## PUT OBJECT
Put a Object in a S3 bucket
    S3 create bucket    test-robotframework-s3-bucket
    S3 put object    test-robotframework-s3-bucket    test-robotframework-s3-object    ../log.html
