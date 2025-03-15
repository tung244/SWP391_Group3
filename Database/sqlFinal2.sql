CREATE TABLE CommentBlog(
comment_blog_id INT IDENTITY(1,1),
commnent NVARCHAR(255),
author_id INT,
tuongtac INT,
parent_comment_id INT,
blog_id INT,
FOREIGN KEY (blog_id) REFERENCES dbo.Blog(blog_id),
FOREIGN KEY(author_id) REFERENCES dbo.Accounts(account_id)
)