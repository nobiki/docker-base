package main

import (
	"fmt"

	"github.com/gin-gonic/gin"

	"database/sql"
	"github.com/bdwilliams/go-jsonify/jsonify"
	_ "github.com/lib/pq"
)

func main() {
	db, err := sql.Open("postgres", "host=gorp-postgres user=user password=pass dbname=gorp sslmode=disable")
	if err != nil {
		panic(err)
	}
	defer db.Close()

	r := gin.Default()
	r.GET("/postgres", func(c *gin.Context) {

		rows, err := db.Query("select * from hoge")
		if err != nil {
			panic(err)
		}
		defer rows.Close()
		output := jsonify.Jsonify(rows)
		fmt.Println(output)

		c.JSON(200, output)
	})
	r.Run(":3001")
}


