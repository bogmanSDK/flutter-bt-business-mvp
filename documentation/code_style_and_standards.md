# BT Business

## Code style and code conventions: 
1. **Project structure (WIP, TBD):**
    - documentation folder with some useful information
    - main Flutter project, introducing the presentation layer with the following structure:
        # COMMON: 
        - extensions            => Useful extensions, could be used for presentation layer
        - utils                 => Some util functionality for the presentation layer
        - constants.dart(TBD)   => Useful constant values (strings)
                
        # DATA (TBD): 
        
        # GENERATED AND l10n - localization related data and generated code
        
        # PRESENTATION: 
        - bloc                  => Representation for all block-components for the app
        - form_validator        => All possible validators for the forms and its fields
        - page                  => Representation for all screen-components for the app
        - rout_builder          => Representation for all transitions for routs
        - styling               => All UI related constants and properties
        - widget                => Representation for all widget-components, used to build a screen-components
        - keys.dart             => Providing a scoped location for all predefined widget keys (e.g. for the testing purposes)
        - application.dart      => Main app runner, respecting different entry-points by its flavor / schema / environment:
            [main_development.dart] => Development environment (testing environment)
            [main_staging.dart]     => Staging environment (To test locally production environment in a send-box)
            [main_production.dart]  => Production environment            
            
2. **Testing the app**
    - any util classes / functions, extensions should be fully unit-tested
    - any complicated widgets with different states and representation could and should be tested
    - the DDD implementation for the activities requires some integration testing
    - path of the specific test should be the same as its testing area (except the main test/ folder)
    
3. **Running the app**
    - each developer should choose different device(OS, density)
    - use hot-reload if possible (If const values/classes are changed - no result will appear)
    - use hot-restart if needed

4. **Common code-style and code conventions:**
    - PLEASE, make documentation for your logic-specific code
    - Rainbow brackets plugin would make your life better and easier :)
    - AndroidStudio -> preferences -> editor -> code style -> all/dart -> Scheme -> Default IDE
    - AndroidStudio -> preferences -> editor -> code style -> dart -> Wrapping and braces -> Hard wrap at 100!
    - use 'optimize imports + format the code' hot keys to make code formatting (not setting-up auto format before commit) 
    - [!!!Tab 'Dart analysis' should be clear all the time]
    - use githooks to perform code formatting, running analyzing and tests
    (short description is bellow)
    - prefer using full-path imports, like "import 'package:trurisk_sme/...'
    - prefer immutability where it possible
    - always add factory constructor copy() to each model (to be easier modified) (Check Freezed package to skipp doing it manually 
    where it possible)
    - don't be scared of a long/implicit function/class/property naming; remember, 
    your colleagues will read it a lot!
    - don't be scared of many extracted widget-classes => this is paying you back always!
    - prefer to use typeDef aliases for making more abstract and universal functionality
    - don't be scared to play with comas to make formatter works for you   

5. **Architecture**    
    Currently, as the arch approach had been chosen - BLoC pattern with impl from flutter_bloc package.
    Please, read carefully the documentation for it and follow the guid lines:
    >> https://bloclibrary.dev/#/ <<
    
    Outdated (In case we switech to REDUX architecture)
    REDUX(TBD)
    - !!! never do anything else in reducer's functions except than modifying the store state,
    please, NO SIDE EFFECTS
    - try to make action-classes as small and verbose as it possible
    - StoreConnector can be used JUST in a -screen class
    - make ViewModel for StoreConnector private, in the same .dart file as its screen
    - distinct should be usually set to TRUE and equals and hashCode for VM 
    should be overridden as well
   
## GITHOOKS
1. Copy githooks you want to use from 'githooks' directory to .git/hooks
(to prevent unwanted hooks to preform)
!!! DO NOT USE PRE-COMMIT hook, we're not looking forward for automated formatting

2. Make sure, the files are executable and has all important permissions
3. Before you commit - enable githooks in IDE Commit window


# pre-commit -> only performs your code formatting 
(make sure to check Reformat code, Rearrange code, Optimize imports)

# pre-push -> running analyzing and tests