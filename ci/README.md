# Jobs du projet ci-tool-stack

- job-builder-seed-job: generateur de job jenkins (scruter toutes les 5mn)
  * pour ajouter de nouveau jobs automatiquement,
    * creer un nouveau repertoire, et un fichier yml correspondant
    * modifier le fichier job-builder-seed-job/seed.yml
    * commiter/push

- job-builder-docker-image: build, test, publish, push docker image
  * pour ajouter une nouvelle image a construire, modifier job-builder-docker-image/config.yaml.inc

- scripts: contient les scripts utilise dans les jobs

- les credentials utilise pour updater jenkins, sont reference dans la variable JJB_USER de job-builder-seed-job/seed.yml

# Usage

Test before commit
```
  make test JJB_JOBS=job-DIR
```

make update is executed in jenkins jobs automatically with seed job
```
  make update JJB_JOBS=job-DIR
```
