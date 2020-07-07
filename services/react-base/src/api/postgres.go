package main

import (
	"fmt"

	"github.com/gin-gonic/gin"

	"github.com/jinzhu/gorm"
	// "github.com/bdwilliams/go-jsonify/jsonify"
	_ "github.com/lib/pq"
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

	r.GET("/postgres/gorm", func(c *gin.Context) {

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

		// output := jsonify.Jsonify(rows)
		output := rows
		fmt.Println(output)

		c.JSON(200, output)
	})
	r.Run(":3001")
}
