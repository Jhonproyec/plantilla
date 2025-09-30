import { prisma } from "@/config/database";
import { logger } from "@/config/logger";

class DepartmentService{
    async getAllDepartment():Promise<any>{
        try {
            const departments = await prisma.departament.findMany({   
                select: {
                    idDepartament: true,
                    name: true
                }
            });
            return departments;
        } catch (error) {
            logger.error("Error al obtener los departamentos: ", error);
            throw error;
        }
    }
}

export const departmentsService = new DepartmentService();