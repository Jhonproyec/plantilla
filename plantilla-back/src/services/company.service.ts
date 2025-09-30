import { prisma } from "@/config/database";
import { logger } from "@/config/logger";

class CompanyService{
    async getAllDepartment():Promise<any>{
        try {
            const companies = await prisma.company.findMany({   
                select: {
                    idCompany: true, 
                    nameCompany: true
                }
            });
            return companies;
        } catch (error) {
            logger.error("Error al obtener las empresas: ", error);
            throw error;
        }
    }
}

export const companyService = new CompanyService();