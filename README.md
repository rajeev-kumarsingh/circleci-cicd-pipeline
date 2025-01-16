# circleci-cicd-pipeline

.circleci/config.yaml

```
---
version: 2.1
jobs:
  build:
    docker:
      - image: circleci/node:14
    steps:
      - checkout
      - run:
          name: install dependencies
          command: npm i
     # - run:
      #    name: Run Test
       #   command: npm test
      - run:
          name: Build Production
          command: npm run build
      - persist_to_workspace:
          root: .
          paths:
            - build
  s3-push:
    docker:
      - image: cimg/python:3.8.16
    steps:
      - checkout
      - attach_workspace:
          at: .
      - run:
          name: Install AWS CLI
          command: pip install  awscli
      - run:
          name: null
          command: |
            aws s3 sync build s3://cicd-bucket-rajeev
workflows:
  buildandpushs3:
    jobs:
      - build
      - s3-push:
          requires:
            - build
          context: AWS-CIRCLECI


```

![CICD FLOW](image.png)
