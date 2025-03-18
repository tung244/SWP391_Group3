CREATE TABLE Token_Google(
token_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
token NVARCHAR(255),
created_date DATETIME

)

CREATE TABLE Token_User(
token_id INT IDENTITY(1,1) PRIMARY KEY,
token_user NVARCHAR(255),
account_id INT,
created_date_token DATETIME,
FOREIGN KEY(account_id) REFERENCES dbo.Accounts(account_id)
)


CREATE TABLE EmailType(
email_type_id INT IDENTITY(1,1),
email_type_name NVARCHAR(255),


)

CREATE TABLE EmailLog(




)