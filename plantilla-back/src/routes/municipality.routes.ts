import { municipalityController } from "@/controllers/municipalityController";
import { Router } from "express";

export const municipalityRoute = Router();

municipalityRoute.get('/', municipalityController.getByDepartment);