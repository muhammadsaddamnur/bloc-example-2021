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

10. add NoParams class, this is using when usecase method have not a params (core->usecase)
11. if your method have params, adding Params class in usecase same file (features->...->domain->usecase)
11. extend entities and Params/NoParams in usecase class. (features->...->domain->usecase)
12. change execute method with call (if you have only one method in usecase) (features->...->domain->usecase)
13. run test
source : https://resocoder.com/2019/09/02/flutter-tdd-clean-architecture-course-3-domain-layer-refactoring/

14. create model test (test->...->data->models)
15. create model (features->...->data->models)
16. create fixture (test->fixtures)
17. update model test (test->...->data->models)
18. update model, add fromJSON method (features->...->data->models)
19. update model test (test->...->data->models)
20. update model, add toJSON method (features->...->data->models)
21. run test
source : https://resocoder.com/2019/09/09/flutter-tdd-clean-architecture-course-4-data-layer-overview-models/

22. create repository implementation (features->...->data->repository)
23. create network info (core->platform)
24. create remote data source (features->...->data->datasource)
25. create exception & failure (core->error)
26. create local data source (features->...->data->datasource)
27. create repository implement test (test->...->data->repository)
28. update repository implementation (features->...->data->repository)
source : https://resocoder.com/2019/09/12/flutter-tdd-clean-architecture-course-5-contracts-of-data-sources/



https://resocoder.com/2019/09/19/flutter-tdd-clean-architecture-course-6-repository-implementation/

write one test,
run test and see how the test fail
write impl
run test, see how the test fail and write impl until it pass

repeat step above for each test