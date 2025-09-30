import { companyService } from "@/services/company.service";
import { Request, Response, NextFunction } from "express";

class CompanyController {
    async getCompanies(_: Request, res: Response, next: NextFunction):Promise<any>{
        try {
            const result = await companyService.getAllDepartment();
            res.status(200).json({
                success: true, 
                message: 'Empresas',
                data:{result}
            });
        } catch (error) {
            next(error);
        }
    }
}

export const companyController = new CompanyController();