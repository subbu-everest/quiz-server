import app from "./app";
import { Request, Response } from "express";
import { HttpError } from "http-errors";

app.set("port", process.env.PORT || 5000);

app.use((req: Request, res: Response) => {
    res.status(404).json({
        message: "That route does not exist ☠️",
        status: 404,
    });
});

app.use((err: HttpError, req: Request, res: Response) => {
    res.status(err.status || 500).json({
        message: err.message || "Something went wrong. Please try again",
        status: err.status || 500,
    });
});

app.listen(app.get("port"), () =>
    console.log(`server is running at %d`, app.get("port"))
);