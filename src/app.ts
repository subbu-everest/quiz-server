import { Request, Response, NextFunction } from "express";
import createError from "http-errors";
import logger from "morgan";
import cookieParser from "cookie-parser";
import express from "express";
import dotenv from "dotenv";
import qs from "qs";

dotenv.config({ path: ".env" });
const app = express();
app.set("query parser", (str: string) => qs.parse(str, { depth: 10 }));
app.use(logger("dev"));
app.use(express.json());
app.use(cookieParser());

// catch 404 and forward to error handler

app.use(function (req: Request, res: Response, next: NextFunction) {
    next(createError(404));
});

export default app;
