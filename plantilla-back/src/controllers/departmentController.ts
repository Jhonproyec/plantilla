import { departmentsService } from "@/services/department.service";
import { Request, Response, NextFunction } from "express";

class DepartmentController{
    async getDepartment(_: Request, res: Response, next: NextFunction):Promise<void>{
        try {
            const result = await departmentsService.getAllDepartment();
            res.status(200).json({
                success:true,
                message: 'Departamentos',
                data: result
            });
        } catch (error) {
            next(error);
        }
    }
}

export const departmentController = new DepartmentController();