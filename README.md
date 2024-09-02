# classroom_project

A new Flutter project.

## Getting Started

# Feature
- Clean Arch
- MobX
- SQLite
- DartZ 
- Freezed

## Layers And Responsabilities

# Presentation
- Screen
    Its a file that is used for just to show widgets in Flutter(front-end)
- Widget
    its a file that share others widgets that use same UI
- State Management(MobX)
    Its a file that is used for management state used in Screen Layer
    its a file that get values from usecase, depend on state, show something

# Domain
- Usecase
   Its a file that call error if its returned by repository, ex: ServerError
   Its a file that call success or message error to presentation layer 
   Its a file that Register Injection Dependencies or local Persistence
- Entity
    Its a file that mold values get from repository
- Repository
    Its a file that hold abtract functions used in Data Layer

# Data

- Repository
    Its a file that implements repository that call datasource
    Its a file that just a bridge to others datasource (api or local)
    
- Model
    Its a file that its a shape to news one TypeValues, Like Students, Classrooms...

- Datasource
    Its a file that call to outside application to get data 
    Its two files that it an abstraction and implementation of datasource



