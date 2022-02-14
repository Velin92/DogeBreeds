# DogeBreeds

For the this small project I decided to use SwiftUI and Combine as frameworks to implement the UI and the reactive layer, since they are also considered by Apple the modern standard to implement the MVVM architecture, which is of course the architectural pattern I used in the project.

The only thing it's actually missing is a Coordinator pattern, which is not quite easy to implement by using SwiftUI, and I felt the complexity of looking into a way to abstract the navigation layer was going to sink a lot of time, for just one single navigation requested by the requirements.

I felt that actually the project was a bit harder than expected, and took me half a day to complete, I admit in fact that I could have written more tests, but I pretty much decided to write two of the most basic ones whcih include also the use of mocked protocols, to show my capability of writing them more than a big code coverage.

The part where I had most difficulties was in fact in how to fetch the URLs of the images, the image URLs for each Dog Breed, are actually not immediately available and require an API call just to get them, which means that for each element of my List View I needed to perform an API call just to get this information, which required some thought in how to handle these extra API calls, how to wait for them, and how to correctly apply each API response to the correct model (since the ```.collect()``` function in combine collects elements in order of completion, not in the original order of request), while mantaining of course good overall perfomances.

After I solved such a problem, the rest was quite simple.
As third party libraries, I used AlamoFire, because I think the amount of out of the box networking functionalities and error handling it provides is just amazing, and prevents the writing of a lot of boilerplate code, and Kingfisher since it's industry standard to handle asynchronous image fetching from URLs, with a great optimisation and support for caching.

I hope the code and UI are quite clear, and to have met the expectations of the project!
