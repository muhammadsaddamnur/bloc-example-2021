clean architecture with bloc

1. create entities from response API (features->...->domain->entities)
2. create failure (core->error)
3. create repository implementation/abstract class (features->...->domain->repository) 
4. create test usecase (test->features->...->domain->usecase)
5. create usecase will be testing (features->...->domain->usecase)
6. udpate test usecase before (test->features->...->domain->usecase)
7. udpate usecase will before (features->...->domain->usecase)
8. udpate test usecase before (test->features->...->domain->usecase)
9. run test 
source: https://resocoder.com/2019/08/29/flutter-tdd-clean-architecture-course-2-entities-use-cases/