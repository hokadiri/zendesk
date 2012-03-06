# README
Files are named after the tasks
E.g Task's One answer is in 'one.rb'

##Task One
I couldn't exactly get this to work as I was still having the same issues as before I sent the email and the response 
from the Engineer wasn't helpful as he was telling me what I already knew.

### Reason it didn't work
I do know how to use a REST API (I've used it in a class project). My problem was understanding the 'response' as the
documentation on the website doesn't provide sufficient information to adequately understande the problem. 
In my case I was getting a response code 200 instead of 201. After much 'googling', I found out it has something to 
do with the 'redirect' (code 302) but I couldn't pin point the issue. The REST API, users or tickets API site didn't 
seem to address the issue of 'redirects' which I noticed by examining the hurl response.

Currently, the code runs but because of the redirect, I get a response code '200' instead of '201'
##Task Two
Works as expected
test.css contains the test css file provided
out.css contains the result after compressing the test.css
##Task three
Works as expected

##Task Four
* Removed the renderer procedure that was being used to initialized the class and made it a class method.
* Removed the class_eval method as it seemed repetitive since one could obtain the posts from the @posts attribute.
* Removed the @current_post attribute. It seemed unnecessary because the code in the render method was iterating through
  the all posts
* Made the render_comments and render_posts take a current_post as an argument because they where methods that operated
  on current posts.
* In render_comments, since I am passing in current_post as an argument, the splat operator wasn't needed anymore so I 
  took it out.
* In the render method, I used the push method of an array to add stuff to the array instead of the '+' method. It just
  seemed a natural way of doing things.
