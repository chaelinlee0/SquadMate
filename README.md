# SquadMate
## Idea
* Help people find, who have the same interest in an event, a group based on those interest for breakouts like discussions and activities 
* Example: projects in a class


## APIs
* Firebase Authentication
* Firebase firestore

## Difficulty
* Many navigation across screens (multiple use types, roles)
* Managing multiple dashboard sub-apps for people who created a group, who joined a group (event creation, group management)

## Jon's Comments/Approvla
* Much respect to the team for taking the time to do the pivot. I wasn't trying to make you do extra work, but I do think this will be more fun to work on. Kudos. Looks great!

## Jon Comments/Approval
* Hello team! For some reason, I did not see this project last week so thanks for the link. I know that the clock is ticking, so I'm fine with this project moving forward. I'm concerned that a significant portion of the value of this project is device-to-device communuication, which we haven't really provided the back end suport for. So you could fake it, or you could set up a Firebase backend. But if that's the bulk of the project, that will be challenging. So for me, I just want to make sure 1) There is enough client-side SwiftUI work to do (and I think that there can be) and 2) that this project is satisfying for you to work on, even though the "hard part" and the utility is somewhat outside the scope of the class.

## Presentaiotn
https://duke.zoom.us/rec/share/7B0iQPA5zKoGdN6kotR0kiuW8DMX5SqR18YbB-r6J7wQgJhBtVFtEBAoYS1rAOaJ.A5pwYpOb0RKavd9Q?startTime=1682304673000


## TODO
[x] navigation for login -> register -> login stacks link on top. Fix that  
[x] add error text on register and login fail  
[x] on createInterst make sure interest is not empty string  
[ ] clear text fields on submits  
[ ] add home navigation form groupHome screen  
[x] login accepts any email/password combo  
[x] complete register   
[x] create group for empty interest  
[ ] leave group not working when going to grouphome directly from homescreen, userInGroup not updating when coming from HomeScreen  
[x] register functionality  
[x] do validation on register  
[ ] shoudl creator be allowed to leave group?  
[ ] validate maxNumberOfMembers in createGroup  
