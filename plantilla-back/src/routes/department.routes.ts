import { departmentController } from "@/controllers/departmentController";
import { Router } from "express";

export const departamentRoute = Router();

departamentRoute.get('/', departmentController.getDepartment);