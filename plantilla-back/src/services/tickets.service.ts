import { drawMultilineText } from "@/utils/multilineText";
import path from "path";

const { createCanvas, loadImage } = require('canvas');
class TicketsService {
    async generateTicketGuateBox(data: any): Promise<Buffer> {
        // === CONFIGURACIÓN DE DPI ===
        const dpi = 400;
        const inchesToPx = (inches: number) => Math.round(inches * dpi);

        // === MEDIDAS DEL TICKET ===
        const width = inchesToPx(3);   // 3 pulgadas de ancho
        const height = inchesToPx(4.5); // 4.5 pulgadas de alto

        const canvas = createCanvas(width, height);
        const ctx = canvas.getContext("2d");

        // === BACKGROUND ===
        const rightImg = await loadImage(path.join(__dirname, "../public/guatebox/bg-img.png"));
        ctx.drawImage(rightImg, 0, 0, width, height);

        // === FECHA ===
        const fecha = new Date(data.updatedAt);
        const opciones: Intl.DateTimeFormatOptions = { weekday: "long", day: "numeric" };
        const formateada = new Intl.DateTimeFormat("es-ES", opciones).format(fecha);

        const [diaCompleto, numero] = formateada.replace(",", "").split(" ");
        const diaAbrev = diaCompleto.slice(0, 3).toUpperCase();
        const fechaFinal = `${diaAbrev} ${numero}`;

        ctx.fillStyle = "#000000";
        ctx.font = `bold ${inchesToPx(0.125)}px bold Arial`; // ~9pt
        ctx.textAlign = "left";
        ctx.fillText(fechaFinal, inchesToPx(0.15), inchesToPx(0.25));

        ctx.fillText(`${data.orderType.charAt(0)} ${data.printerTicker ? ' - R' : ''}`, inchesToPx(0.15), inchesToPx(0.45));

        // === ÁREA DE CONTENIDO ===
        // NOMBRE DEL CLIENTE
        ctx.fillStyle = "#000000";
        ctx.font = `bold ${inchesToPx(0.12)}px Arial`;
        ctx.textAlign = "center";
        ctx.fillText(data.fullName || "", width / 2, inchesToPx(1.3));
        // NIT DEL CLIENTE
        ctx.fillStyle = "#000000";
        ctx.font = `bold ${inchesToPx(0.12)}px Arial`;
        ctx.textAlign = "center";
        ctx.fillText(`NIT: ${data.nit}` || "", width / 2, inchesToPx(1.5));

        // DIRECCIÓN DEL CLIENTE (multilínea con padding lateral)
        let address = `${data.address}, ${data.municipality.departament.name} ${data.municipality.name}`;
        const paddingX = inchesToPx(0.2);
        const maxWidth = width - paddingX * 2;
        const lineHeight = inchesToPx(0.15);

        drawMultilineText(ctx, [address], width / 2, inchesToPx(1.7), maxWidth, lineHeight);

        // TELÉFONO
        ctx.fillText(`${data.phone} - ${data.phoneTwo}`, width / 2, inchesToPx(2.2));

        // ORDEN
        drawMultilineText(ctx, data.orderDetails, width / 2, inchesToPx(2.4), maxWidth, lineHeight);

        // PAGO
        let paymentType =
            data.paymentType === "SOLO_ENTREGA"
                ? "SOLO ENTREGA"
                : "RECIBE PAGO Q." + data.paymentAmount;

        ctx.fillText(paymentType, width / 2, inchesToPx(3.5));

        // CHECKBOX
        ctx.strokeStyle = "#000000";
        ctx.lineWidth = 2;
        ctx.strokeRect(inchesToPx(0.15), inchesToPx(3.4), inchesToPx(0.2), inchesToPx(0.2));

        return canvas.toBuffer("image/png");
    }

    async generateTicketHolySport(data: any): Promise<any> {
        // === CONFIGURACIÓN DE DPI ===
        const dpi = 300;
        const inchesToPx = (inches: number) => Math.round(inches * dpi);

        // === MEDIDAS DEL TICKET ===
        const width = inchesToPx(3);   // 3 pulgadas de ancho
        const height = inchesToPx(4.5); // 4.5 pulgadas de alto

        const canvas = createCanvas(width, height);
        const ctx = canvas.getContext("2d");

        // === BACKGROUND ===
        const rightImg = await loadImage(path.join(__dirname, "../public/holysport/bg-img.png"));
        ctx.drawImage(rightImg, 0, 0, width, height);

        ctx.fillStyle = "#000000";
        ctx.font = `bold ${inchesToPx(0.125)}px bold Arial`; // ~9pt

        // NOMBRE DEL CLIENTE
        ctx.fillStyle = "#000000";
        ctx.font = `bold ${inchesToPx(0.12)}px Arial`;
        ctx.textAlign = "center";
        ctx.fillText(data.fullName || "", width / 2, inchesToPx(1.5));
        // NIT DEL CLIENTE
        ctx.fillStyle = "#000000";
        ctx.font = `bold ${inchesToPx(0.12)}px Arial`;
        ctx.textAlign = "center";
        ctx.fillText(`NIT: ${data.nit}` || "", width / 2, inchesToPx(1.7));


        // DIRECCIÓN DEL CLIENTE (multilínea con padding lateral)
        let address = `${data.address}, ${data.municipality.departament.name} ${data.municipality.name}`;
        const paddingX = inchesToPx(0.2);
        const maxWidth = width - paddingX * 2;
        const lineHeight = inchesToPx(0.15);

        drawMultilineText(ctx, [address], width / 2, inchesToPx(1.9), maxWidth, lineHeight);

        // TELÉFONO
        ctx.fillText(`${data.phone} - ${data.phoneTwo}`, width / 2, inchesToPx(2.36));
        // ORDEN
        drawMultilineText(ctx, data.orderDetails, width / 2, inchesToPx(2.5), maxWidth, lineHeight);

        // PAGO
        let paymentType =
            data.paymentType === "SOLO_ENTREGA"
                ? "SOLO ENTREGA"
                : "RECIBE PAGO Q." + data.paymentAmount;

        ctx.fillText(paymentType, width / 2, inchesToPx(3.5));

        // CHECKBOX
        ctx.strokeStyle = "#000000";
        ctx.lineWidth = 2;
        ctx.strokeRect(inchesToPx(0.15), inchesToPx(3.3), inchesToPx(0.2), inchesToPx(0.2));


        const fecha = new Date(data.updatedAt);
        const opciones: Intl.DateTimeFormatOptions = { weekday: "long", day: "numeric" };
        const formateada = new Intl.DateTimeFormat("es-ES", opciones).format(fecha);

        const [diaCompleto, numero] = formateada.replace(",", "").split(" ");
        const diaAbrev = diaCompleto.slice(0, 3).toUpperCase();
        const fechaFinal = `${diaAbrev} ${numero}`;

        ctx.fillStyle = "#000000";
        ctx.font = `bold ${inchesToPx(0.125)}px bold Arial`; // ~9pt
        ctx.textAlign = "left";
        ctx.fillText(fechaFinal, inchesToPx(0.15), inchesToPx(4.4));

        ctx.textAlign = "right"; // ahora X será el final del texto
        ctx.fillText(
            `${data.orderType.charAt(0)} ${data.printerTicker ? ' - R' : ''}`,
            width - inchesToPx(0.15), // margen derecho
            inchesToPx(4.4)
        );

        return canvas.toBuffer('image/png');

    }
}
export const ticketsService = new TicketsService();