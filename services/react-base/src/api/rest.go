package main

import (
	"os"
	"fmt"
	"log"
	// "time"

	// "github.com/gin-contrib/sessions"
	// "github.com/gin-contrib/sessions/cookie"
	"github.com/gin-gonic/gin"
	// "github.com/utrack/gin-csrf"

	"github.com/jinzhu/gorm"
	// "github.com/bdwilliams/go-jsonify/jsonify"
	_ "github.com/lib/pq"

	"github.com/sendgrid/sendgrid-go"
	"github.com/sendgrid/sendgrid-go/helpers/mail"
)

type Experience struct {
	Id          int
	Year        int
	Description string
	Text        string
}

var experiences []Experience

func main() {
	r := gin.Default()

	// // csrf
	// store := cookie.NewStore([]byte("secret"))
	// r.Use(sessions.Sessions("csrf_token", store))
	// r.Use(csrf.Middleware(csrf.Options{
	// 	Secret: string(time.Now().Unix())+"aRwm_0Q8",
	// 	ErrorFunc: func(c *gin.Context) {
	// 		c.String(400, "CSRF token mismatch")
	// 		c.Abort()
	// 	},
	// }))
    //
	// r.GET("/protected", func(c *gin.Context) {
	// 	c.Writer.Header().Set("Access-Control-Allow-Origin", "*")
	// 	c.Writer.Header().Set("Access-Control-Allow-Methods", "GET,HEAD,PUT,PATCH,POST,DELETE")
    //
	// 	store := cookie.NewStore([]byte("secret"))
	// 	r.Use(sessions.Sessions("csrf_token", store))
	// 	c.String(200, csrf.GetToken(c))
	// })

	r.POST("/send-contact", func(c *gin.Context) {
		// c.Writer.Header().Set("Access-Control-Allow-Origin", "*")
		// c.Writer.Header().Set("Access-Control-Allow-Methods", "GET,HEAD,PUT,PATCH,POST,DELETE")

		name := c.PostForm("name")
		email := c.PostForm("email")

		from := mail.NewEmail(name, email)
		subject := c.PostForm("subject")
		to := mail.NewEmail("portfolio", os.Getenv("PORTFOLIO_ENV_TO"))
		plainTextContent := c.PostForm("message")
		htmlContent := plainTextContent
		sendmail := mail.NewSingleEmail(from, subject, to, plainTextContent, htmlContent)
		client := sendgrid.NewSendClient(os.Getenv("PORTFOLIO_ENV_EMAIL_API_KEY"))
		response, err := client.Send(sendmail)
		if err != nil {
			log.Println(err)
		} else {
			fmt.Println(response.StatusCode)
			fmt.Println(response.Body)
			fmt.Println(response.Headers)
		}

		c.JSON(200, gin.H{
			"status":  "posted",
			"name": name,
			"email": email,
			"subject": subject,
			"message": plainTextContent,
		})
	})

	r.GET("/get-experiences", func(c *gin.Context) {
		// c.Writer.Header().Set("Access-Control-Allow-Origin", "*")
		// c.Writer.Header().Set("Access-Control-Allow-Methods", "GET,HEAD,PUT,PATCH,POST,DELETE")

		db, err := gorm.Open("postgres", "host=postgres user=user password=pass dbname=portfolio sslmode=disable")
		if err != nil {
			panic(err)
		}
		defer db.Close()

		rows := db.Find(&experiences)
		if err != nil {
			panic(err)
		}
		defer rows.Close()

		output := rows
		fmt.Println(output)

		c.JSON(200, output)
	})

	r.Run(":3001")
}
