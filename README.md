# news_app

## Finished Product

- Check the screen recording below:
- <img src="https://github.com/BasakK6/news_app/blob/master/readme_assets/news_app_screen_recording.gif?raw=true" alt="UI screen recording" width="250"/>
- News text is very small so we can't see the Sliver AppBar animation. I repeated the news text few times to get a longer text and see the app bar animation. Check the screen recording below:
- <img src="https://github.com/BasakK6/news_app/blob/master/readme_assets/news_app_sliver_app_bar_animation.gif?raw=true" alt="UI screen recording" width="250"/>


## Things I considered/used while I'm coding this project

1) Clean Architecture
2) Test Driven Development
3) CI (Github Actions)
4) Linter Rules
5) SOLID principles
6) State management with Riverpod
7) Error handling with Dartz
8) Responsive UI
9) Android permissions (native android development)
10) Basic Animations (Sliver App Bar)

## How to run this project

1) Get your API keys from these API providers:
   - [OpenAI Completions API - ChatGPT](https://platform.openai.com/docs/guides/gpt/completions-api)
   - [News API](https://newsapi.org/docs/endpoints/top-headlines)
2) Create a Dart file called **api_keys.dart** under **lib/core/configs/api** folder (lib/core/configs/api/api_keys.dart) 

   - Your file should look like this:
   - <img src="https://github.com/BasakK6/news_app/blob/master/readme_assets/api_keys.dart%20screenshot.png?raw=true" alt="UI screen recording" width="500"/>

3) Create 2 constant String variables named **kNewsAPIKey** and **kOpenAIKey** inside the api_keys.dart
4) Initialize your variables with your API keys
5) Run **flutter pub get** and all the errors caused by the missing file should disappear
6) Now you are ready to run the project 🎉

## Project/Assignment Details
### Project: News Summarization App with ChatGPT Integration
- Estimated Completion Time: 3-5 days
Project Deadline: Please submit the project within 5 days of receiving the assignment.
- Overview:
We're challenging you to create a news application that provides summarized news articles
using the ChatGPT API. This assignment is designed to evaluate your ability to deliver
high-quality work within an expedited time frame.

### Requirements:
1. User Interface:
   - You can use the UI kits, we’ve shared.
   - Intuitive UI with a home screen displaying a list of news articles.
   - Include a detailed view for each article with its summary.
   - Implement basic animations for UI elements to enhance user experience.
2. News API Integration:
   - Utilize a free public news API (e.g., NewsAPI, GNews API) to fetch a list of news articles.
   - Display headlines, publication date, and a brief description for each article.
3. Summarization with ChatGPT or any other free API you choose:
   - Integrate the ChatGPT API to generate concise summaries for each news article.
   - Use the free version of the API.
4. State Management & Data Handling:
   - Utilize a state management approach for managing app state.
   - Implement error handling for API calls and edge cases.
5. Unit Testing:
   - Write unit tests for critical functions or logic in the application.
6. Submission:
   - Provide a GitHub repository with the codebase.
   - Provide a functioning apk file
   - Include a README file with clear instructions on how to run the application.
     Additional Resources:
   - You can use a free public news API like [NewsAPI](https://newsapi.org/) or [GNews
     API](https://gnews.io/).
   - Figma is free to use up to 3 projects and you can use the UI kits in the drive.