
const express = require("express");

const port = 3000;
const app = express();

// Middleware: allows Express to read JSON request bodies
app.use(express.json());

app.get("/", (req, res) => {
    res.send("Miguel Miguel");
});

app.post("/", (req, res) => {
    res.json({
        message: "POST request successful",
        receivedData: req.body
    });
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
