import { dashboardController } from "@/controllers/dashboardController";
import { Router } from "express";

export const dashboardRoute = Router();

dashboardRoute.get('/kpi', dashboardController.getKpi);