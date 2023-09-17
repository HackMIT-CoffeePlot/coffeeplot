# Inspiration
One of our teammates's mom's used to drive from coffeeshop to coffeeshop trying to get coffee grounds for her garden as compost. We wanted to make that process a whole lot easier for her and everyone to be able to get compost easily and also to reduce the amount of food waste from businesses going to landfills.

# What it does
Introducing CoffeePlot, an app that helps you find compost near you from local coffee shops and restaurants. Our features include:
- a map with pinpoints filtered by the type of compost in the listing such as: coffee grounds, food scraps, and yard waste
- a list format for businesses near you and filters based on the type of compost
- personal and global stats for how many people and businesses have made composting more accessible

# How we built it
This was decently challenging as we had a solid idea but it was 3/4 of the team's first time using Flutter for app development and getting used to the framework was a hurdle we tried to cross. We also spent lots of time whiteboarding and documenting what our vision for this app was going to look like: 

![image000000](https://github.com/HackMIT-CoffeePlot/coffeeplot/assets/115097531/ce84efb5-e886-49e9-8f10-84825e530910)
![image000001](https://github.com/HackMIT-CoffeePlot/coffeeplot/assets/115097531/7e77ca57-f194-48f2-a7fa-4ae44df7b9e4)

## Backend
Our backend leverages the power of the Django framework. Here's a snapshot of our backend journey:

### Successes:
- **Django REST Framework**: This has been instrumental in handling user authentication requests.
- **SQLite Database**: We adopted SQLite for user data storage, anticipating scalability up to 100k hits/day.
- **Serializers**: An efficient bridge between Flutter and Django was established using serializers. This facilitated a robust connection and token authentication mechanism.
- **UML Diagram**: Our UML diagram showcases the communication channels between the models, ensuring clarity in operations.
### Challenges:
- **Token Authentication**: Aiming to boost user confidence in our platform's security, we embarked on integrating the knox token authentication. Despite its enhanced security over Django's default system, its complexity posed significant challenges. Consequently, after a time-consuming troubleshooting process, we reverted to Django's default authentication.
- **Flutter Shared Preferences**: This was a hurdle that remained unconquered. We encountered challenges with Flutter's shared preferences, which consumed significant development time, shifting our focus from the backend.
However, these challenges were counterbalanced by our intensive efforts on the frontend, ensuring a captivating user experience.

### Future Aspirations:
We're in the process of charting our backend improvements. One intriguing potential inclusion is an **AI Chatbot**, leveraging the capabilities of **GPT-4**, to cater to our compost users.

![image000000](https://github.com/HackMIT-CoffeePlot/coffeeplot/assets/115097531/3f557546-bf1c-4ad1-94eb-6f8ae0a6fb37)


## Front End: 
We did the frontend with **Flutter** creating custom pages and a navbar with the main functionalities of the app. (such as map, favorites, lists, stats) We also implemented the map using **Google Maps API** and we wanted to have custom styling for the map but Flutter doesn't support it :(

Spent lots of time on Figma with color options, typography and several views for each of the pages on the app. 

![Screenshot 2023-09-17 at 4 46 00 AM](https://github.com/HackMIT-CoffePlot/coffeplot/assets/115097531/556eaaf7-3898-42b7-b55f-e54c4290e8ac)

# Challenges we ran into

We struggled a lot iniatilly with getting set up in the proper dev environment for Flutter as there are a lot of dependencies that need to be downloaded. The IOS devices we had also weren't able to connect so we had to use a Pixel emulator to develop on. This means that the app isn't compatible with Apple devices yet but that is something we would like to implement. 

Also since many of us were beginners in Flutter, many of the simple things like the search bar and the listing view were super hard to implement and we had to save some of the features as images to get the basic functionality down. 

# Accomplishments that we're proud of

All of us met everyday the week leading up to the hackathon to plan and scope out our project. Brainstorming every day, defining the functions of the app, and designing the UI 

We were able to get everything onto the app that we wanted, although it took much longer that we would have liked.

# What we learned

We learned a lot more about Flutter and how to work with Dart. We also learned not to use `knox authentication` for hackathons haha

# What's next for Coffee Plot

We want to implement the following:
 - a rating system for users for each listing
 - messaging system between users (besides comments)
 - an **AI Chatbot**, leveraging the capabilities of **GPT-4**, to cater to our compost users.
