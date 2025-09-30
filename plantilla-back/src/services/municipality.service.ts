import { prisma } from "@/config/database";
import { logger } from "@/config/logger";

class MunicipalityService{
    async getByDepartment(idDepartament: number):Promise<any> {
        try {
            const municipalities = await prisma.municipality.findMany({
                where: {idDepartament: idDepartament},
                select: {
                    idDepartament: true, 
                    idMunicipality: true,
                    name: true
                }
            });
            return municipalities;
        } catch (error) {
            logger.error("Error al obtener los municipios: ", error);
            throw(error);
        }
    }
}

export const municipalitiesService = new MunicipalityService();