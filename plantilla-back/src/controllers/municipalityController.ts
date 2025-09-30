import { municipalitiesService } from "@/services/municipality.service";
import { Request, Response, NextFunction } from "express";

class MunicipalityController {
    async getByDepartment(req: Request, res: Response, next: NextFunction):Promise<any>{
        try {
            const {idDepartament} = req.query;
            const result = await municipalitiesService.getByDepartment(Number(idDepartament));
            res.status(200).json({
                success: true, 
                message: 'Municipios',
                data:{result}
            });
        } catch (error) {
            next(error);
        }
    }
}

export const municipalityController = new MunicipalityController();