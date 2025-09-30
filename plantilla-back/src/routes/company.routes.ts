import { companyController } from "@/controllers/companyController";
import { Router } from "express";

export const companyRoute = Router();

companyRoute.get('/', companyController.getCompanies);