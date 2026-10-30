
const express = require("express");

const port = 3000;
const app = express();

// Middleware: allows Express to read JSON request bodies
app.use(express.json());

app.get("/", (req, res) => {
    res.send("Miguel Miguel");
});

app.get("/user", (req, res) => {
    res.send("Hello Sathi");
})

app.post("/add", (req, res) => {

    const { username, password } = req.body;

    if (!username || !password) {

        console.log("username or password not available");


    }

    if (password.length > 8){
        res.status(400).json({
            success: false,
            message: "PASSWORD REQUIRED MORE THEN 8 CHARACTERS"
        })
    }
    console.log(username);
    console.log(password);

    return res.send("User Created");
    res.status(200).json(
        {
            success: true,
            data:{username,password},
            message:"user response saved"
        }

    )



});


app.put("/", (req, res) => {
    res.json({
        message: "PUT request successful",
        updatedData: req.body
    });
});

app.delete("/", (req, res) => {
    res.send("DELETE request successful");
});

app.listen(port, () => {
    console.log(`Server connected at http://localhost:${port}`);
});
